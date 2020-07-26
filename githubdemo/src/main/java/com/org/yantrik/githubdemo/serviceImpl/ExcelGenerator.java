package com.org.yantrik.githubdemo.serviceImpl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.org.yantrik.githubdemo.model.UserSearchHistory;

public class ExcelGenerator {
	public static ByteArrayInputStream dataToExcel(List<UserSearchHistory> searchHistory) throws IOException {
		String[] COLUMNs = { "Id", "UserName", "UserType", "SearchQuery", "Result", "Creationtime" };
		try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream();) {
			CreationHelper createHelper = workbook.getCreationHelper();

			Sheet sheet = workbook.createSheet("SearchHistorydtls");

			Font headerFont = workbook.createFont();
			headerFont.setBold(true);
			headerFont.setColor(IndexedColors.BLUE.getIndex());

			CellStyle headerCellStyle = workbook.createCellStyle();
			headerCellStyle.setFont(headerFont);

			Row headerRow = sheet.createRow(0);

			for (int col = 0; col < COLUMNs.length; col++) {
				Cell cell = headerRow.createCell(col);
				cell.setCellValue(COLUMNs[col]);
				cell.setCellStyle(headerCellStyle);
			}

			CellStyle ageCellStyle = workbook.createCellStyle();
			ageCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("#"));

			int rowIdx = 1;
			for (UserSearchHistory history : searchHistory) {
				Row row = sheet.createRow(rowIdx++);

				row.createCell(0).setCellValue(history.getId());
				row.createCell(1).setCellValue(history.getUsername());
				row.createCell(2).setCellValue(history.getUserType());
				row.createCell(3).setCellValue(history.getSearchquery());
				row.createCell(4).setCellValue(history.getResults());

				Cell ageCell = row.createCell(5);
				ageCell.setCellValue(history.getTimestamp().toString());
				ageCell.setCellStyle(ageCellStyle);
			}

			workbook.write(out);
			return new ByteArrayInputStream(out.toByteArray());
		}
	}
}
