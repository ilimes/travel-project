package com.project.trip.beans;

import org.apache.log4j.LogManager;
import org.apache.log4j.jdbc.JDBCAppender;
import org.apache.log4j.spi.LoggingEvent;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class CustomJDBCAppender extends JDBCAppender {

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

    @Override
    protected String getLogStatement(LoggingEvent event) {

        Object eventMsgObj = event.getMessage();
        String eventMessage = "";

        if( eventMsgObj != null && eventMsgObj.toString() != null ) {
            // DB에 입력하기 위해서는 (') 를 ('')로 치환해야지 에러없이 제대로 입력된다.
            eventMessage = eventMsgObj.toString().replaceAll("'", "''").replaceAll("(?<!\r)\n", "\r\n");
        }

        if (null != event.getThrowableInformation() ) {

            // DB에 저장할 때는 "\r\n" 이 아닌 "\n"만 "\r\n"으로 바꾼다.
            // 부정형 후방탐색 정규표현식 이용 => replaceAll("(?<!\r)\n", "\r\n")
            Throwable throwable = event.getThrowableInformation().getThrowable();

            String message = "";
            if( throwable != null ) {
                message = throwable.getMessage();
                if( message != null ) {
                    message = message.replaceAll("'", "''").replaceAll("(?<!\r)\n", "\r\n");
                }
            }

            Exception exception = new Exception(message, throwable);

            exception.setStackTrace(throwable.getStackTrace());

            LoggingEvent clone = new LoggingEvent(event.fqnOfCategoryClass,
                    LogManager.getLogger(event.getLoggerName()), event.getLevel(), eventMessage, exception);

            return getLayout().format(clone);
        } else {
            LoggingEvent clone = new LoggingEvent(event.fqnOfCategoryClass,
                    LogManager.getLogger(event.getLoggerName()), event.getLevel(), eventMessage, null);

            return getLayout().format(clone);
        }
    }
}


