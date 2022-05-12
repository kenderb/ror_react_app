import React, { useEffect, useState } from "react";

  const Home = () => {
    const [courses, setCourses] =  useState([])
    const [userData, setUserData] =  useState({ name: "", email: ""})
    const [success, setSuccess] =  useState(false)

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

    const onSubmit = (e) => {
      e.preventDefault();
      console.log("submitting...", userData);
      const url = `api/v1/users/${userData.email}`;

      fetch(url, {
        method: 'PATCH',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: userData.name
        }),
      })
      .then((data) => {
        if (data.ok) {
          setSuccess(true)
        }
        throw new Error("Network error.");
      })
      .catch((err) => console.log(err));
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
      <br />
      <h2>Change user name: </h2>
      <div>
        <form onSubmit={onSubmit}>
          <label>
            Type the email of the user you want yo change:
            <input 
              type="text" 
              name="email" 
              value={ userData.email }
              onChange={(e) => setUserData({...userData, email: e.target.value })}
            />
          </label>
          <label>
            Type the new name for the User:
            <input 
              type="text" 
              name="name"
              value={ userData.name }
              onChange={(e) => setUserData({...userData, name: e.target.value })}
            />
          </label>
          <input type="submit" value="Submit" />
        </form>
        <div style={{color: "green"}}>
          {success && `Name for user with email: ${userData.email } changed.`}
        </div>
      </div>
    </div>
  )
};

export default Home;