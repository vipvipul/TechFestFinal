package studentdata;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String site;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			process(request);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(site);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void process(HttpServletRequest request) throws Exception {

		try {
			//List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request); or below 3 lines above for loop
			
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
      		ServletFileUpload upload = new ServletFileUpload(factory);
			
			// Parse the request
			List<FileItem> items = upload.parseRequest(request);

			// Process the uploaded items
			for (FileItem item : items) {

				if (!item.isFormField()) {  // Process the form file field (input type="file")

					String fileName = FilenameUtils.getName(item.getName());

					System.out.println("Filename -> " + fileName);

					String realPath = getServletContext().getRealPath("/");

					File file = new File(realPath + "/uploadFolder");

					file.mkdir();

					String prefix = FilenameUtils.getBaseName(fileName) + "_";

					String suffix = "." + FilenameUtils.getExtension(fileName);

					// Prepare filename prefix and suffix for an unique filename in upload folder.

					File tempFile = File.createTempFile(prefix, suffix, file);

					System.out.println("tempFile -> " + tempFile);

					item.write(tempFile); // File uploaded to "uploadFolder" in Web Server(Not database)

					// Save the File path(String) to Database now.
					String i = request.getParameter("qn");
					site = "/compile.jsp?qn=" + i + "&tempfile=" + tempFile;

				}
			}

		} catch (FileUploadException e) {

			e.printStackTrace();

			throw new Exception(e);

		} catch (IOException e) {

			e.printStackTrace();

			throw new Exception(e);

		} catch (Exception e) {

			e.printStackTrace();

			throw new Exception(e);
		}

	}
}
