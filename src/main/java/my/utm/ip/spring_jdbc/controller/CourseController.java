package my.utm.ip.spring_jdbc.controller;

import my.utm.ip.spring_jdbc.entity.Course;
import my.utm.ip.spring_jdbc.service.*;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/")
    public String listCourses(Model model) throws SQLException {
        List<Course> courses = courseService.listAllCourses();
        courses.forEach(course -> System.out.println(course));
        model.addAttribute("courses", courses);
        return "CourseList";
    }

    @PostMapping("/add")
    public ModelAndView showAddForm() {
        ModelAndView modelAndView = new ModelAndView("CourseForm");
        modelAndView.addObject("course", new Course());
        modelAndView.addObject("action", "add");
        return modelAndView;
    }

    @PostMapping("/edit/{id}")
    public ModelAndView showEditForm(@PathVariable("id") int id) throws SQLException {
        Course course = courseService.getCourse(id);
        ModelAndView modelAndView = new ModelAndView("CourseForm");
        modelAndView.addObject("course", course);
        modelAndView.addObject("action", "edit");
        return modelAndView;
    }

    @PostMapping("/save")
    public String saveCourse(@ModelAttribute("course") Course course, @RequestParam("action") String action) throws SQLException {
        if ("add".equals(action)) {
        courseService.addCourse(course);
        System.out.println("Working out course");
        } else if ("edit".equals(action)) {
        courseService.updateCourse(course);
        }
        return "redirect:/courses/";
        }

    @GetMapping("/delete/{id}")
        public String deleteCourse(@PathVariable("id") int id) throws SQLException {
            courseService.deleteCourse(id);
            return "redirect:/courses/";
        }
    }        
