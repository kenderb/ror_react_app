import React, { useEffect, useState } from "react";

  const Home = () => {
    const [courses, setCourses] =  useState([])
    const [users, setUsers] =  useState([])
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
    
    const get_users = () => {
      const url = "api/v1/users/index";
      fetch(url)
        .then((data) => {
          if (data.ok) {
            return data.json();
          }
          throw new Error("Network error.");
        })
        .then((data) => {
          setUsers(data)
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
          get_users()
          setSuccess(true)
        }
        throw new Error("Network error.");
      })
      .catch((err) => console.log(err));
    };

    useEffect(() => {
      get_courses()
      get_users()
    }, []);

    const formUI = (
      <form onSubmit={onSubmit}>
        <label>
          Type the email of the user you want yo change:
        </label>
        <br />
        <input 
          type="text" 
          name="email" 
          value={ userData.email }
          onChange={(e) => setUserData({...userData, email: e.target.value })}
        />

      <br />
        <label>
          Type the new name for the User:
        </label>
        <br />
        <input 
          type="text" 
          name="name"
          value={ userData.name }
          onChange={(e) => setUserData({...userData, name: e.target.value })}
        />

        <br />
        <br />
        <input type="submit" value="Submit" />
      </form>
    )

  return (
    <div>
      <h1>All courses</h1>
      <table className="table">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Name</th>
              <th scope="col">Students</th>
              <th scope="col">Instructors</th>
              <th scope="col">Books</th>
              <th scope="col">Created at</th>
            </tr>
          </thead>
          <tbody>
            {courses.map((course) =>{
              return(
                <tr>
                  <th scope="row">{course.id}</th>
                  <td>{course.name}</td>
                  <td>{course.students}</td>
                  <td>{course.instructors}</td>
                  <td>{course.books}</td>
                  <td>{course.created_at}</td>
                </tr>
              )
            })}
          </tbody>
      </table>
      <div className="container-fluid">
        <h2>Change user name: </h2>
        {formUI}
        <div>
        <div style={{color: "green"}}>
          {success && `Name for user with email: ${userData.email } changed.`}
        </div>
      </div>
      </div>
      <div className="container-fluid">
        <h2>All users</h2>
        <table className="table">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Email</th>
              <th scope="col">Name</th>
              <th scope="col">Role</th>
              <th scope="col">Course</th>
            </tr>
          </thead>
          <tbody>
            {users.map((user) =>{
              return(
                <tr>
                  <th scope="row">{user.id}</th>
                  <td>{user.email}</td>
                  <td>{user.name}</td>
                  <td>{user.role}</td>
                  <td>{user.course}</td>
                </tr>
              )
            })}
          </tbody>
        </table>
      </div>
    </div>
  )
};

export default Home;