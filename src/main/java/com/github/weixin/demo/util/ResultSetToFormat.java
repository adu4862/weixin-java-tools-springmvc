package com.github.weixin.demo.util;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;



public class ResultSetToFormat {
    /**
     * ResultSet 转换为list
     * @param rs ResultSet结果集
     * @return list集合
     */
    public static  List<Object> RsToJson(ResultSet rs) {
        JsonObject element = null;
        JsonArray ja = new JsonArray();
        ResultSetMetaData rsmd = null;
        String columnName, columnValue = null;
        List<Object> list=new ArrayList<Object>();
        try {
            rsmd = rs.getMetaData();
            while (rs.next()) {
                element = new JsonObject();
                for (int i = 0; i < rsmd.getColumnCount(); i++) {
                    columnName = rsmd.getColumnName(i + 1);
                    columnValue = rs.getString(columnName);
                    element.addProperty(columnName, columnValue);
                }
                ja.add(element);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (JsonElement jsonElement : ja) {
            list.add(jsonElement);
        }
        return list;
    }



}
