package com.project.trip.beans;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.jdbc.JDBCAppender;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class CustomJDBCAppender_bak extends JDBCAppender{

    @Override
    protected Connection getConnection() throws SQLException {
        if(connection == null) {
            DriverManagerDataSource dataSource = (DriverManagerDataSource) BeanFactoryHandler.getBean("dataSourceSpied");
            connection = dataSource.getConnection();
//            DataSourceTransactionManager dstm = (DataSourceTransactionManager) BeanFactoryHandler.getBean("txManager");
//           connection = DataSourceUtils.getConnection(dstm.getDataSource());
            return connection;
        } else{
            return connection;
        }
    }

}

