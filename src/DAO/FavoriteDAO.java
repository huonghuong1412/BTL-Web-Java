package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Favorite;

public class FavoriteDAO {
	public static boolean insertFavourite(Favorite favorite, Connection conn) {
		PreparedStatement preparedStatement = null;
		String sql = "insert into favourite (CustomerID, ProductID) value(?,?)";
		try {
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, favorite.getIdCustomer());
			preparedStatement.setInt(2, favorite.getIdProduct());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public static List<Favorite> ListFavorite(int idCus, Connection conn) throws SQLException{
		Favorite favorite = null;
		List<Favorite> list = new ArrayList<>();
		PreparedStatement preparedStatement = null;
		String sql = "select * from favourite where CustomerID=?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, idCus);
		System.out.println(preparedStatement);
		
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()) {
			int idFavorite = rs.getInt("FavouriteID");
			
			int idProduct = rs.getInt("ProductID");
			list.add(new Favorite(idFavorite, idCus, idProduct));
//			System.out.println("oooo");
		}
		return list;
	}
	
	public static boolean deleteFavorite(int idCus, int idPro, Connection conn) {
		PreparedStatement preparedStatement = null;
		String sql ="delete from favourite where CustomerID=? and ProductID=?";
		try {
			preparedStatement = conn.prepareStatement(sql);
			System.out.println(preparedStatement);
			preparedStatement.setInt(1, idCus);
			preparedStatement.setInt(2, idPro);
			int rs = preparedStatement.executeUpdate();
			if(rs == 0)return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
		
	public static int existFavorite(int idCus, int idPro, Connection conn) {
		int count = 0;
		PreparedStatement preparedStatement = null;
		String sql ="select count(*) from favourite where CustomerID=? and ProductID=?";
		try {
			preparedStatement = conn.prepareStatement(sql);
			System.out.println(preparedStatement);
			preparedStatement.setInt(1, idCus);
			preparedStatement.setInt(2, idPro);
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
					}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
