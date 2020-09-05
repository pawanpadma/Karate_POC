import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

// important: do not use @RunWith(Karate.class) !
//@RunWith(Karate.class)
/*@KarateOptions(tags = {"@scoreCard"},
//        @member,@updateMember,@overlappingTransaction,@overlappingTransactionMiles
        //without explicitly scoping the feature files to this package Karate will pick up features in base
        features = "classpath:com/com/onlinereveiws/tests"
)*/
public class DemoTestRunnerTest {
 /*@Test
  public void testParallel() throws IOException {
    System.out.println(this.getClass().toString());

  }*/

  /*  @Karate.Test
    Karate testFullPath() {

            return Karate.run().relativeTo(getClass());
        }*/

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:com/demo/tests").tags("@getusers").parallel(1);
        //assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        generateReport(results.getReportDir());
        Assertions.assertTrue(results.getFailCount() == 0,results.getErrorMessages());
    }
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


}
