package com.caec.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnSQL {
	private static Connection con;
	private static Statement sql;
	private static String Driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://139.196.16.67:3306/whateat?useUnicode=true&characterEncoding=utf8";
	private static String username = "root";
	private static String password = "TYwy2016720";
	private static String useUnicode = "true";
	private static String characterEncoding = "utf8";

	public static Connection getConnection() {

		try {
			Class.forName(Driver);

			con = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public static Statement getStatement() {
		try {
			Class.forName(Driver);

			con = DriverManager.getConnection(url, username, password);

			sql = con.createStatement();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sql;
	}

}
