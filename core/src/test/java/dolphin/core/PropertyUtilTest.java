package dolphin.core;

import org.junit.Assert;
import org.junit.Test;

import com.dolphin.util.PropertyUtil;


public class PropertyUtilTest {

	@Test
	public void testGetFacebookAppId(){
		PropertyUtil prop = new PropertyUtil();
		String facebookAppId = prop.get("DOLPHIN_FB_ID");
		Assert.assertNotNull(facebookAppId);
	}
}
