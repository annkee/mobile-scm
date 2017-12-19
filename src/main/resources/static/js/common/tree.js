var treeDefaultProps = {
    fontSize: 12,
    indent: 15, //层级间缩进量
    height: 22, //条目的高度
    spacing: 5, //行元素间距离
    expandLevel: 1, //默认展开级别    
    cookieId: undefined, //是否将当前节点展开与否状态写入COOKIE, null不写入，若写入应指定些树的ID，以便与其它树实例区分
    animateSpeed: 100, //动画速度， 为0则无动画
    urlTarget: "_self", //绑定URL时，HREF目标
    //控制图片相关
    expandImg: "../images/expand.png",
    collapseImg: "../images/collapse.png",
    nodeImg: "../images/node.png",
    picTopPos: 0, //控制图片上下的定位距离,为负数上移，正数下移
    fieldNameMap: { // 数据对象成员变量名映射
        id: "id",
        label: "label",
        url: "url",
        action: "action",
        img: "img",
        subTree: "subTree"
    }
};

if (jQuery) {
    (function($){
        $.fn.extend({
            tree: function(data, properties, render){
                // 如果未传入配置属性对象，使用默认属性对象
                var _properties = properties ? properties : treeDefaultProps;
                // 要显示树的容器
                var _container = this;
                //  _container.css("font-size", _properties.fontSize);
                //渲染行的类实例
                var _renderer = new Renderer(_properties);
                //渲染行的方法
                var _render = render ? render : defaultRender;                
                
                // 构建树DOM节点方法
                function drawNode(nodeList, level, ul){
                
                    for (var i = 0; i < nodeList.length; i++) {
                        //生成LI并设置样式及属性
                        var li = $("<li></li>").appendTo(ul);
                        li.css("list-style", "none").css("white-space:nowrap");
                        li.css("line-height", _properties.height + "px");
                        li.css("padding-left", _properties.indent);
                        li.appendTo(ul);
                        
                        li.level = level;
                        li.data = nodeList[i];
                        li.renderer = _renderer;
                        
                        var curDataId = nodeList[i][_properties.fieldNameMap.id];
                        li.id = ul.id ? ul.id + "." + curDataId : curDataId;
                        li.attr("id", li.id);
                        
                        var curLiSubTree = nodeList[i][_properties.fieldNameMap.subTree];
                        li.hasChildren = curLiSubTree && curLiSubTree.length > 0;
                        
                        // 如果有子菜单
                        if (li.hasChildren) {
                            // 初始化子层容器UL
                            var subUL = $("<ul style='margin:0;padding:0'></ul>").attr("id", li.id);
                            subUL.id = li.id;
                            li.ul = subUL;
                            // 处理UL可见性, 因为UL内对象在当前级的下级，所以将level+1做为级别参数
                            ulVisible(subUL, level + 1);
                        }
                        
                        addControlImg(li); // 添加控制图片
                        _render(li);
                        
                        if (li.hasChildren) {//递归处理，生成下级菜单
                            drawNode(curLiSubTree, level + 1, subUL);
                            subUL.appendTo(li);
                        }
                    }
                }
                
                //添加控制图片
                function addControlImg(li){
                    //$("<img />").attr("src", "images/node.png").appendTo(li);
                    
                    if (li.hasChildren) {
                        var img;
                        if (li.ul.visible) {
                            img = _renderer.addImg(li, _properties.collapseImg, _properties.picTopPos);
                        } else {
                            img = _renderer.addImg(li, _properties.expandImg, _properties.picTopPos);
                        }
                        
                        //展开折叠树的事件
                        img.click(function(){
                            var _thisImg = this;
                            _properties.animateSpeed > 0 && (Browser.isIE(6) || Browser.isIE(7)) && $("img, input").css("position", "");
                            $(this).parent().children("ul").slideToggle(_properties.animateSpeed, function(){
                                _thisImg.src = _thisImg.src.endWith(_properties.expandImg) ? _properties.collapseImg : _properties.expandImg;
                                _properties.animateSpeed > 0 && (Browser.isIE(6) || Browser.isIE(7)) && $("img, input").css("position", "relative");
                            });
                        });
                    } else {
                        _renderer.addImg(li, _properties.nodeImg, _properties.picTopPos);
                    }
                    
                }
                
                // 处理UL可见性
                function ulVisible(ul, level){
                    if (_properties.cookieId) { //如果状态写入COOKIE，根据COOKIE值确定
                    } else { //根据展开级别属性确定
                        if (level > _properties.expandLevel) {
                            ul.css("display", "none");
                            ul.visible = false;
                        } else {
                            ul.css("display", "");
                            ul.visible = true;
                        }
                    }
                }
                
                //开始生成树
                var rootUL = $("<ul style='margin:0;padding:0;'></ul>").css("margin-left", -parseInt(_properties.indent) + "px").appendTo(_container);
                drawNode(data, 1, rootUL);
            }
        });
    })(jQuery);
};

/**
 * 条目渲染类
 * @param {Object} prop
 */
var Renderer = function(prop){
    this._properties = prop;
    // 向条目行中加入图片
    this.addImg = function(o, src, pos, alignType){
        pos = pos ? parseInt(pos) : 0;
        var img = $("<img/>").css("margin-right", parseInt(this._properties.spacing) + "px")//.css("position", "relative").css("top", pos + "px");
        img.attr("src", src);
        alignType && img.attr("align", alignType);
        img.appendTo(o);
		img.removeAttr("height");
		img.removeAttr("width");
        return img;
    }
    
    // 向行中加入文本
    this.addLabel = function(o, text, callback, eventType){
        var span = $("<span></span>").html(text).css("margin-right", parseInt(this._properties.spacing) + "px").css("cursor", "default").appendTo(o);
        if (callback) {
            eventType = eventType ? eventType : "click";
            span.bind(eventType, callback);
            span.css("cursor", "pointer");
        }
        return span;
    }
    
    //向行中加入链接
    this.addLink = function(o, text, href, target){
        var link = $("<a></a>").html(text);
        link.attr("href", href);
        link.attr("target", target);
        o.append(link);
        return link;
    }
    
    // 向行中加入复选框
    this.addCheckbox = function(o, pos, id, callback, eventType){
        pos = pos ? parseInt(pos) : 0;
        id = id ? id : o.id;
        var input = $("<input type='checkbox'/>").css("position", "relative").css("top", pos + "px").css("margin-right", parseInt(this._properties.spacing) + "px");
        if (id) {
            input.attr("id", id);
        }
        if (callback) {
            eventType = eventType ? eventType : "click";
            input.bind(eventType, callback);
        }
        
        input.appendTo(o);
        return input;
    }
}

/**
 * 默认渲染条目方法
 */
function defaultRender(item){
    var prop = item.renderer._properties;
    
    var action = item["data"][prop.fieldNameMap.action];
    var url = item["data"][prop.fieldNameMap.url];
    
    // 如果指定了URL字段,绑定URL
    if (url && url.trim().length > 0) {
        item.renderer.addLink(item, item["data"][prop.fieldNameMap.label], url, prop.urlTarget);
    } else if (action && action.trim().length > 0) { //如果有ACTION字段绑定ACTION
        item.renderer.addLabel(item, item["data"][prop.fieldNameMap.label], function(){
            if (typeof(action) == "string") {
                eval(action);
            } else if (action instanceof Function) {
                action.call(this);
            }
        });
    } else {
        item.renderer.addLabel(item, item["data"][prop.fieldNameMap.label]);
    }
}

var sampleData = [{
    id: '001',
    label: '系统管理',
    url: '',
    action: 'alert("hello");',
    img: '',
    subTree: [{
        id: '101',
        label: '用户管理',
        url: '',
        action: '',
        img: '',
        subTree: [{
            id: '1011',
            label: '外网用户',
            url: 'http://www.baidu.com'
        }]
    }, {
        id: '102',
        label: '角色管理',
        url: '',
        action: '',
        img: ''
    }]
}, {
    id: '002',
    label: '基础数据',
    subTree: [{
        id: '201',
        label: '机构设置'
    }, {
        id: '202',
        label: '型号设置',
        subTree: [{
            id: '2021',
            label: '手机型号'
        }, {
            id: '2022',
            label: '配件型号'
        }]
    }]
}];

