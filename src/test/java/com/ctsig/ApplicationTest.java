package com.ctsig;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import java.text.DecimalFormat;

/**
 * Unit test for simple App.
 */
public class ApplicationTest
        extends TestCase {
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */

    public ApplicationTest(String testName) {
        DecimalFormat df = new DecimalFormat("0");

        System.out.println((df.format(Math.abs(-1.0 / 3) * 100)) + "%");
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite() {
        return new TestSuite(ApplicationTest.class);
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp() {
        assertTrue(true);
    }
}
