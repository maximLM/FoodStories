package main_package;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

public class Render {

    private static Configuration cfg;

    private static Configuration getCfg() throws IOException {
        if (cfg == null) {
            cfg = new Configuration();
            cfg.setDirectoryForTemplateLoading(new File("W:/WEBM_PROJECTS/FoodStoriesProject/food_stories/web/templates"));
            cfg.setDefaultEncoding("UTF-8");
        }
        return cfg;
    }

    public static void render(HttpServletResponse response, Map<String, Object> context, String templateName) throws IOException, TemplateException {
        Configuration cfg = getCfg();
        Template template = cfg.getTemplate(templateName);
        template.process(context, response.getWriter());
    }
}