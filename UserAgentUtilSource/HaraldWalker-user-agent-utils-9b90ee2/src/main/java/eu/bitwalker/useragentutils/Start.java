package eu.bitwalker.useragentutils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class Start {

	final static Charset ENCODING = StandardCharsets.UTF_8;

	public Start() {

	}

	void processUserAgents(String aFileName) throws IOException {

		try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream("processed_" + aFileName), "UTF-8"))) {
			try (BufferedReader reader = new BufferedReader(new FileReader(
					aFileName))) {
				String line = null;
				int count = 0;
				while ((line = reader.readLine()) != null) {
					// System.out.println(getUserAgent(line));
					System.out.println(count);
					count++;
					writer.write(String.valueOf(getUserAgent(line)));
					writer.newLine();

				}
			}
		}
	}

	private int getUserAgent(String args) {
		UserAgent userAgent = UserAgent.parseUserAgentString(args);
		return userAgent.getId();
	}

	public static void main(String[] args) throws InvalidInputException,
			IOException {
		Start start = new Start();
		start.processUserAgents("useragents_extracted.txt");

	}
}
