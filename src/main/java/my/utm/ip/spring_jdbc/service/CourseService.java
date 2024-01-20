package my.utm.ip.spring_jdbc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.utm.ip.spring_jdbc.entity.Course;
import my.utm.ip.spring_jdbc.repository.CourseRepository;

import java.util.List;

@Service
public class CourseService {

    private final CourseRepository courseRepository;

    @Autowired
    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> listAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourse(int id) {
        return courseRepository.findById(id);
    }

    public void addCourse(Course course) {
        courseRepository.save(course);
    }

    public void updateCourse(Course course) {
        if (course.getId() > 0) {
            courseRepository.save(course);
        } 
    }

    public void deleteCourse(int id) {
        courseRepository.deleteById(id);
    }
}
