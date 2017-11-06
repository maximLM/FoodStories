package main_package;

import java.util.Calendar;
import java.util.Date;

public class Helper {

    public static final String CURRENT_USER_KEY = "current_user";

    public static Calendar toCalendar(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }
}
