package my.utm.ip.spring_jdbc.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import my.utm.ip.spring_jdbc.entity.Course;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final class CourseMapper implements RowMapper<Course> {
        public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
            Course course = new Course();
            course.setId(rs.getInt("id"));
            course.setName(rs.getString("name"));
            course.setDescription(rs.getString("description"));
            return course;
        }
    }

    public List<Course> findAll() {
        String sql = "SELECT * FROM courses";
        return jdbcTemplate.query(sql, new CourseMapper());
    }

    public Course findById(int id) {
        String sql = "SELECT * FROM courses WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new CourseMapper(), id);
    }

    public void save(Course course) {
        if (course.getId() > 0) {
            // Update
            String sql = "UPDATE courses SET name = ?, description = ? WHERE id = ?";
            jdbcTemplate.update(sql, course.getName(), course.getDescription(), course.getId());
        } else {
            // Insert
            String sql = "INSERT INTO courses (name, description) VALUES (?, ?)";
            jdbcTemplate.update(sql, course.getName(), course.getDescription());
            System.out.println("Working");
        }
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM courses WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
