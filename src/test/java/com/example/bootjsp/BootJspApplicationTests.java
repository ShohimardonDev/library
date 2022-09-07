package com.example.bootjsp;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.PDFTextStripperByArea;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.io.IOException;

class BootJspApplicationTests {

    public static void main(String[] args) {
        try (PDDocument document = PDDocument.load(new File("/home/shohimardon/1657254991283.pdf"))) {

            document.getClass();

            if (!document.isEncrypted()) {

                PDFTextStripperByArea stripper = new PDFTextStripperByArea();
                stripper.setSortByPosition(true);

                PDFTextStripper tStripper = new PDFTextStripper();

                String pdfFileInText = tStripper.getText(document);
                //System.out.println("Text:" + st);

                // split by whitespace


            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}