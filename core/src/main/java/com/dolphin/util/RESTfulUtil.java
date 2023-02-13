package com.dolphin.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.logging.Logger;

public class RESTfulUtil {
	/**
	 * Logger
	 */
	public static Logger LOG = Logger.getLogger("RESTfulUtil");
	
	/**
	 * @param hsu
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public static String getTicketGrantingTicket(HttpURLConnection hsu, String username, String password) throws Exception {
		String s = URLEncoder.encode("username", "UTF-8") + "=" + URLEncoder.encode(username, "UTF-8");
		s += "&" + URLEncoder.encode("password", "UTF-8") + "=" + URLEncoder.encode(password, "UTF-8");

		LOG.info("Encoded URL s =  " + s);
		OutputStreamWriter out = new OutputStreamWriter(hsu.getOutputStream());
		BufferedWriter bwr = new BufferedWriter(out);
		bwr.write(s);
		bwr.flush();
		bwr.close();
		out.close();
		String tgt = hsu.getHeaderField("location");
		if (tgt == null || hsu.getResponseCode() != 201) {
			throw new Exception("Error TGT is null or invalid response code " + hsu.getResponseCode());
		}
		LOG.info("Tgt is : " + tgt.substring(tgt.lastIndexOf("/") + 1));
		hsu.disconnect();
		return tgt.substring(tgt.lastIndexOf("/") + 1);
	}
	
	/**
	 * @param hsu
	 * @param restAuthServiceUrl
	 * @param tgt
	 * @param serviceURL
	 * @return
	 * @throws Exception
	 */
	public static String getServiceTicket(HttpURLConnection hsu, String restAuthServiceUrl, String tgt, String serviceURL) throws Exception {
		try {
			String encodedServiceURL = URLEncoder.encode("service", "utf-8") + "="
					+ URLEncoder.encode(serviceURL, "utf-8");

			String tgtURL = restAuthServiceUrl + "/" + tgt;
			hsu = (HttpURLConnection) openConn(tgtURL, "POST");
			OutputStreamWriter out = new OutputStreamWriter(hsu.getOutputStream());
			BufferedWriter bwr = new BufferedWriter(out);
			out = new OutputStreamWriter(hsu.getOutputStream());
			bwr = new BufferedWriter(out);
			bwr.write(encodedServiceURL);
			bwr.flush();
			bwr.close();
			out.close();

			LOG.info("ST Response code is:  " + hsu.getResponseCode());

			BufferedReader isr = new BufferedReader(new InputStreamReader(hsu.getInputStream()));
			String serviceTicket = null;
			String tmpStr;
			
			while ((tmpStr = isr.readLine()) != null) {
				serviceTicket = tmpStr;
			}
			isr.close();
			hsu.disconnect();
			return serviceTicket;
		} catch (MalformedURLException mue) {
			mue.printStackTrace();
			throw mue;

		} catch (IOException ioe) {
			ioe.printStackTrace();
			throw ioe;
		}

	}
	
	/**
	 * Open a connection to server with REQUEST_METHOD definition
	 * @param urlk
	 * @param method
	 * @return
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public static URLConnection openConn(String urlk, String method) throws MalformedURLException, IOException {
		URL url = new URL(urlk);
		HttpURLConnection hsu = (HttpURLConnection) url.openConnection();
		hsu.setConnectTimeout(5000);
        hsu.setReadTimeout(5000);
        hsu.setUseCaches(true);
        
        // Prevent user from wrong setting request method
        if("POST".equals(method) || "PUT".equals(method)){
            hsu.setDoOutput(true);            
        }else{
            hsu.setDoInput(true);
        }
		hsu.setRequestMethod(method);
		
		return hsu;
	}
	public static void logout(HttpURLConnection hsu, String restAuthServiceUrl, String tgtTicket) throws Exception{
		try {
			String tgtURL = restAuthServiceUrl + "/" + tgtTicket;
			hsu = (HttpURLConnection) openConn(tgtURL, "DELETE");
		} catch (IOException ioe) {
			ioe.printStackTrace();
			throw ioe;
		}
	}


}