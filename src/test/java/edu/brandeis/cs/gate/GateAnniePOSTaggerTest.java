package edu.brandeis.cs.gate;

import edu.brandeis.cs.service.AbstractWebService;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

/** 
* GateAnniePOSTagger Tester. 
* 
* @author <Authors name> 
* @since <pre>ʮ���� 21, 2015</pre> 
* @version 1.0 
*/ 
public class GateAnniePOSTaggerTest { 

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
    AbstractWebService ws = new GateAnniePOSTagger();
    String res = ws.execute("How are you today, Mike? Fine thank you.");
    System.out.println(res);
} 


} 
