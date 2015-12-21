package edu.brandeis.cs.gate;

import edu.brandeis.cs.json.XmlToJson;
import edu.brandeis.cs.service.ServiceException;
import org.lappsgrid.serialization.lif.Container;

/**
 * Created by shi on 12/20/15.
 */
public class GateAnnieNamedEntityRecognizer extends AbstractGateAnnieService {


    String dsl = null;

    public GateAnnieNamedEntityRecognizer(){
        dsl = getTemplate();
    }

    @Override
    public String execute(Container json) throws ServiceException {
        String txt = json.getText();
        try {
            String xml = getXML(txt);
            return XmlToJson.transform(xml, dsl);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }
}
