package com.yorizip.recipe.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ApiExplorer {
    public static void main(String[] args) {
        try {
            // �⺻ API URL �� �ʼ� �Ķ���� ����
            String apiKey = "67f9fcdd1106497bb4f2"; // ���� API Ű�� ����
            String serviceId = "COOKRCP01"; // ���� ID
            String dataType = "json"; // ��û ���� Ÿ��
            String startIdx = "1"; // ��û ���� ��ġ
            String endIdx = "5"; // ��û ���� ��ġ

            // URL�� �����մϴ�.
            StringBuilder urlBuilder = new StringBuilder("http://openapi.foodsafetykorea.go.kr/api/");
            urlBuilder.append(apiKey)
                      .append("/")
                      .append(serviceId)
                      .append("/")
                      .append(dataType)
                      .append("/")
                      .append(startIdx)
                      .append("/")
                      .append(endIdx);

            // URL ��ü�� �����ϰ� HTTP ������ ���ϴ�.
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            System.out.println("Response code: " + conn.getResponseCode()); // ���� �ڵ� ���

            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            // ���� ����� �о���Դϴ�.
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            System.out.println(sb.toString()); // ���� ��� ���
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
