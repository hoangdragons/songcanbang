package com.dolphin.ws;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;

import com.dolphin.util.PropertyUtil;

@Path("/file")
public class FileUploadService {
	public static final String UPLOADED_FILE_PARAMETER_NAME = "file";
    //public static final String UPLOAD_DIR = "/opt/upload/";
	final PropertyUtil prop = new PropertyUtil();
    @Path("/video-upload")
    @POST
    @Consumes("multipart/form-data")
    public Response uploadVideo(MultipartFormDataInput input) {
    	Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
    	
		String UPLOAD_DIR = prop.get("upload.dir");
        List<InputPart> inputParts = uploadForm.get(UPLOADED_FILE_PARAMETER_NAME);

        for (InputPart inputPart : inputParts){
            MultivaluedMap<String, String> headers = inputPart.getHeaders();
            String filename = getFileName(headers);

            try{
                InputStream inputStream = inputPart.getBody(InputStream.class,null);
                byte [] bytes = IOUtils.toByteArray(inputStream);
                writeFile(bytes, UPLOAD_DIR + "/videos/" + filename);
            } catch (IOException e) {
        		e.printStackTrace();
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(e.getMessage()).build();
            }
        }
        return Response.status(Response.Status.OK).build();
    }
    
    @Path("/image-upload")
    @POST
    @Consumes("multipart/form-data")
    public Response uploadImage(MultipartFormDataInput input) {
    	Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
        List<InputPart> inputParts = uploadForm.get(UPLOADED_FILE_PARAMETER_NAME);
        String UPLOAD_DIR = prop.get("upload.dir");
        for (InputPart inputPart : inputParts){
            MultivaluedMap<String, String> headers = inputPart.getHeaders();
            String filename = getFileName(headers);

            try{
                InputStream inputStream = inputPart.getBody(InputStream.class,null);
                byte [] bytes = IOUtils.toByteArray(inputStream);
                writeFile(bytes, UPLOAD_DIR + "/images/" + filename);
            } catch (IOException e) {
        		e.printStackTrace();
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(e.getMessage()).build();
            }
        }
        return Response.status(Response.Status.OK).build();
    }
    
    @Path("/voice-upload")
    @POST
    @Consumes("multipart/form-data")
    public Response uploadVoice(MultipartFormDataInput input) {
    	Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
        List<InputPart> inputParts = uploadForm.get(UPLOADED_FILE_PARAMETER_NAME);
        String UPLOAD_DIR = prop.get("upload.dir");
        for (InputPart inputPart : inputParts){
            MultivaluedMap<String, String> headers = inputPart.getHeaders();
            String filename = getFileName(headers);

            try{
                InputStream inputStream = inputPart.getBody(InputStream.class,null);

                byte [] bytes = IOUtils.toByteArray(inputStream);

                writeFile(bytes, UPLOAD_DIR + "/voices/" + filename);
            } catch (IOException e) {
        		e.printStackTrace();
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(e.getMessage()).build();
            }
        }
        return Response.status(Response.Status.OK).build();
    }
    
    @Path("/file-upload")
    @POST
    @Consumes("multipart/form-data")
    public Response uploadFile(MultipartFormDataInput input) {
        Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
        List<InputPart> inputParts = uploadForm.get(UPLOADED_FILE_PARAMETER_NAME);
        String UPLOAD_DIR = prop.get("upload.dir");
        for (InputPart inputPart : inputParts){
            MultivaluedMap<String, String> headers = inputPart.getHeaders();
            String filename = getFileName(headers);

            try{
                InputStream inputStream = inputPart.getBody(InputStream.class,null);

                byte [] bytes = IOUtils.toByteArray(inputStream);

                writeFile(bytes, UPLOAD_DIR + "/materials/" + filename);
            } catch (IOException e) {
        		e.printStackTrace();
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(e.getMessage()).build();
            }
        }
        return Response.status(Response.Status.OK).build();
    }

    private void writeFile(byte[] content, String filename) throws IOException {
        File file = new File(filename);
        
        if (!file.exists()) {
            file.createNewFile();
        }

        FileOutputStream fop = new FileOutputStream(file);

        fop.write(content);
        fop.flush();
        fop.close();
    }

    /**
     * Extract filename from HTTP heaeders.
     * @param headers
     * @return
     */
    private String getFileName(MultivaluedMap<String, String> headers) {
        String[] contentDisposition = headers.getFirst("Content-Disposition").split(";");

        for (String filename : contentDisposition) {
            if ((filename.trim().startsWith("filename"))) {

                String[] name = filename.split("=");

                String finalFileName = sanitizeFilename(name[1]);
                return finalFileName;
            }
        }
        return "unknown";
    }

    private String sanitizeFilename(String s) {
        return s.trim().replaceAll("\"", "");
    }
}
