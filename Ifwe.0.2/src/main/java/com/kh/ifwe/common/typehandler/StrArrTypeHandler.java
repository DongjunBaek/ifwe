package com.kh.ifwe.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 * 하나의 setter(Java -> DB)
 *  -PreparedStatement에 값대입용
 * 
 * 세개의 getter(DB -> Java)
 *  -ResultSet 컬럼명
 *  -ResultSet 컬럼인덱스
 *  -CallableStatement 호출시 컬럼인덱스
 * 
 * 
 *
 */
public class StrArrTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		
		//["C" , "java","javascript"] => " C,java,javascript"
		if(parameter != null) {
			ps.setString(i, String.join(",", parameter));
		}else {
			ps.setString(i, "");
		}
	
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String str = rs.getString(columnName);
		String[] strArr = null;
		if(str != null) {
			strArr = str.split(",");
		}
		
		return strArr;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String str = rs.getString(columnIndex);
		String[] strArr = null;
		if(str != null) {
			strArr = str.split(",");
		}
		
		
		return strArr;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String str = cs.getString(columnIndex);
		String[] strArr = null;
		if(str != null) {
			strArr = str.split(",");
		}
		
		return strArr;
	}


}
