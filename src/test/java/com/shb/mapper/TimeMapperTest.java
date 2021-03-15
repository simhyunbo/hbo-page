package com.shb.mapper;




import org.junit.*;
import org.junit.runner.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;





@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TimeMapperTest {
	
	private static final Logger log = LoggerFactory.getLogger(TimeMapperTest.class);
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		
		log.info(timeMapper.getTime());
	}
	
}
