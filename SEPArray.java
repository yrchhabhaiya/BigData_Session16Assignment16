package hive;

import java.util.ArrayList;
import org.apache.hadoop.hive.ql.exec.UDF;

public class SEPArray extends UDF{

	public String evaluate (String separator, ArrayList<String> array) {
		StringBuffer sBuffer;
		
		if (array == null) {
			return null;
		}
		
		sBuffer = new StringBuffer();
		sBuffer.append(array.get(0));
		
		for (int i=1; i < array.size(); i++) {
			sBuffer.append(separator);
			sBuffer.append(array.get(i));
		}
		
		return sBuffer.toString();
	}
		
}
