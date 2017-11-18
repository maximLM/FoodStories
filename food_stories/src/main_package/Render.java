package main_package;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;
import java.util.Map;

public class Render {

    private static Configuration cfg;

    private static Configuration getCfg() throws IOException {
        if (cfg == null) {
            cfg = new Configuration();
            cfg.setDirectoryForTemplateLoading(new File(Helper.ROOT_OF_PROJECT + "/web/templates"));
            cfg.setDefaultEncoding("UTF-8");
        }
        return cfg;
    }

    public static void render(HttpServletResponse response, Map<String, Object> context, String templateName) throws IOException, TemplateException {
        response.setCharacterEncoding("UTF-8");
        Configuration cfg = getCfg();
        Template template = cfg.getTemplate(templateName);
        template.process(context, response.getWriter());
    }
    public static String render(Map<String, Object> context, String templateName) throws IOException, TemplateException {
        System.out.println("in render");
        StringWriter sw = new StringWriter();

        System.out.println("1");
        Configuration cfg = getCfg();
        System.out.println("2");
        Template template = cfg.getTemplate(templateName);
        System.out.println("3");
        System.out.println("context = " + context);
        template.process(context, sw);
        System.out.println("s = " + sw.toString());
        System.out.println("4");
        return sw.toString();
    }
}