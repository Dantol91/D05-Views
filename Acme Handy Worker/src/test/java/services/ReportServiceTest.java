
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Report;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class ReportServiceTest extends AbstractTest {

	//Service under test
	@Autowired
	private ReportService	reportService;


	@Test
	public void testCreateReport() {
		final Report report;
		report = this.reportService.create();
		Assert.notNull(report);
	}

	@Test
	public void testDeleteReport() {

		final Report report;
		report = this.reportService.findOne(super.getEntityId("report2"));
		this.reportService.delete(report);

	}

	@Test
	public void testFindAllReport() {
		final Collection<Report> reports;
		reports = this.reportService.findAll();
		Assert.notEmpty(reports);
		Assert.notNull(reports);

	}

	@Test
	public void testFindOneReport() {
		final Report report;

		report = this.reportService.findOne(super.getEntityId("report1"));
		Assert.notNull(report);

	}

}
