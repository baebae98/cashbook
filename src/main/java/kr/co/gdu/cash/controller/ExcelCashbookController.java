package kr.co.gdu.cash.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
@Scope("singleton")
public class ExcelCashbookController {
   @GetMapping(path="/admin/cashbookListExcel", produces = "application/vnd.ms-excel")
   public String cashbookListExcel() {
      return "cashbookExcelView";
   }
}
@Component("cashbookExcelView")
@Scope("prototype") //컨포넌트의 기본 값음 singleton 임
class CashbookExcelView extends AbstractXlsView{
   @Autowired CashbookService cashbookService;
   @Override
   protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      response.setHeader("Content-Disposition", "attachment;filename=\"cashbook.xls\"");
      List<Cashbook> cashbookList = cashbookService.getCashbookListAll();
      Sheet sheet = workbook.createSheet();
      Row titleRow = sheet.createRow(0);
      titleRow.createCell(0).setCellValue("cashbookId");
      titleRow.createCell(1).setCellValue("cashbookKind");
      titleRow.createCell(2).setCellValue("categoryname");
      titleRow.createCell(3).setCellValue("cashbookPrice");
      titleRow.createCell(4).setCellValue("cashbookContent");
      titleRow.createCell(5).setCellValue("cashbookDate");
      titleRow.createCell(6).setCellValue("createDate");
      titleRow.createCell(7).setCellValue("updateDate");
      
      //각 열의 크기를 지정함
      sheet.setColumnWidth(0, 5000);
      sheet.setColumnWidth(1, 5000);
      sheet.setColumnWidth(2, 5000);
      sheet.setColumnWidth(3, 5000);
      sheet.setColumnWidth(4, 20000);
      sheet.setColumnWidth(5, 5000);
      sheet.setColumnWidth(6, 5000);
      sheet.setColumnWidth(7, 5000);
      
      //1행 A열의 정렬을 가운데로 맞춤
      CellStyle style = titleRow.getCell(0).getCellStyle();
      style.setAlignment(HorizontalAlignment.CENTER);
      
      //A열부터 8개의 열에 대해 정렬을 복제함
      sheet.setDefaultColumnStyle(0, style);
      sheet.setDefaultColumnStyle(1, style);
      sheet.setDefaultColumnStyle(2, style);
      sheet.setDefaultColumnStyle(3, style);
      sheet.setDefaultColumnStyle(4, style);
      sheet.setDefaultColumnStyle(5, style);
      sheet.setDefaultColumnStyle(6, style);
      sheet.setDefaultColumnStyle(7, style);
      
      int rowNum = 1;
      for(Cashbook c : cashbookList) {
         Row row = sheet.createRow(rowNum);
         row.createCell(0).setCellValue(c.getCashbookId());
         row.createCell(1).setCellValue(c.getCashbookKind());
         row.createCell(2).setCellValue(c.getCategoryName());
         row.createCell(3).setCellValue(c.getCashbookPrice());
         row.createCell(4).setCellValue(c.getCashbookContent());
         row.createCell(5).setCellValue(c.getCashbookDate());
         row.createCell(6).setCellValue(c.getCreateDate());
         row.createCell(7).setCellValue(c.getUpdateDate());
         
         rowNum += 1;
      }
   }
}