import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SQLConnection {

    public static void main(String[] args) throws SQLException {
        // Параметры подключения к базе данных
        String url = "jdbc:postgresql://localhost:5432/users";
        String user = "postgres";
        String password = "2406";

        Connection connection = null;

        try {

            Class.forName("org.postgresql.Driver");

            // Установка соединения с базой данных
            connection = DriverManager.getConnection(url, user, password);

            if (connection != null) {
                System.out.println("Успешное подключение к базе данных PostgreSQL!");

            } else {
                System.out.println("Не удалось подключиться к базе данных PostgreSQL.");
            }
        } catch (SQLException e) {
            System.out.println("Ошибка при подключении к базе данных PostgreSQL.");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }



        Faker faker = new Faker();

        try (PreparedStatement st = connection.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            for (int i = 0; i < 1000; i++) {
                st.setInt(1,  1 + i);
                st.setString(2, faker.name().lastName());
                st.setString(3, faker.name().firstName());
                st.setString(4, faker.name().lastName());
                st.setString(5, String.valueOf(faker.date().birthday()));
                st.setString(6, faker.job().field());
                st.setString(7, faker.nation().nationality());
                st.setString(8, faker.phoneNumber().cellPhone());
                st.setString(9, faker.internet().emailAddress());
                st.addBatch();
            }
            st.executeBatch();
        }
    }
}
