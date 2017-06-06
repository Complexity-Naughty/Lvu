import java.text.SimpleDateFormat;
import java.util.Date;

public class datetest {

	public static void main(String[] args) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
		Date time = new Date();
		System.out.println(dateFormat.format(time));
	}

}
