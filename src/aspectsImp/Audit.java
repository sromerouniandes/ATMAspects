package aspectsImp;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Audit {
	public static void auditLogFile(String source, String data) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			String fileName = "./" + source.toLowerCase() + "_" + formatter.format(new Date()) + ".log";
			File file = new File(fileName);
			file.createNewFile();
			BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file ,true));
			bufferedWriter.write(data);
			bufferedWriter.newLine();
			bufferedWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
	}
}
