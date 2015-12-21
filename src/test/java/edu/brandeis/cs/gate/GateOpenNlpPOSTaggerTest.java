package edu.brandeis.cs.gate;

import edu.brandeis.cs.service.AbstractWebService;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

/** 
* GateOpenNlpPOSTagger Tester. 
* 
* @author <Authors name> 
* @since <pre>ʮ���� 21, 2015</pre> 
* @version 1.0 
*/ 
public class GateOpenNlpPOSTaggerTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: execute(Container json) 
* 
*/ 
@Test
public void testExecute() throws Exception {
    AbstractWebService ws = new GateOpenNlpPOSTagger();
    String res = ws.execute("How are you today? Fine thank you.");
    System.out.println(res);
} 


} 
