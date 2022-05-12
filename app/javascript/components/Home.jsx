import React, { useEffect, useState } from "react";

  const Home = () => {
    const [courses, setCourses] =  useState([])
    const get_courses = () => {
      const url = "api/v1/courses/index";
      fetch(url)
        .then((data) => {
          if (data.ok) {
            return data.json();
          }
          throw new Error("Network error.");
        })
        .then((data) => {
          setCourses(data)
        })
        .catch((err) => console.log("error", err));
    };

    useEffect(() => {
      get_courses()
    }, []);
    
  return (
    <div>
      <h1>All courses</h1>
      <ul>
      {courses.map((course) =>{
        return(
          <li key={course.id}>{course.name}</li>
        )
      })}
      </ul>
    </div>
  )
};

export default Home;