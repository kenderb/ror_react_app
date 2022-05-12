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
      const url = `api/v1/users`;

      fetch(url, {
        method: 'PATCH',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: userData.name,
          email: userData.email
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
        <label className="form-label">
          Type the email of the user you want yo change:
        </label>
        <br />
        <input 
          type="text" 
          name="email"
          className="form-control"
          value={ userData.email }
          onChange={(e) => setUserData({...userData, email: e.target.value })}
          required
        />

      <br />
        <label className="form-label">
          Type the new name for the User:
        </label>
        <br />
        <input 
          type="text" 
          name="name"
          className="form-control"
          value={ userData.name }
          onChange={(e) => setUserData({...userData, name: e.target.value })}
          required
        />
        <div className="mx-auto mt-3" style={{width: "150px"}}>
          <button type="submit" value="Submit" className="btn btn-primary" style={{width: "100%"}}>
            Change name
          </button>
        </div>

      </form>
    );

    const coursesTableUI = (
      <table className="table table-striped">
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
    )

    const usersTableUI = (
      <table className="table table-striped">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Email</th>
          <th scope="col">Name</th>
          <th scope="col">Role</th>
          <th scope="col">Course</th>
          <th scope="col">Reading Times</th>
          <th scope="col">Updated at</th>
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
              <td>
                <ul>
                  {user.reading_times?.map((reading_time => (
                    <li>
                      <p>Book title: {reading_time.title}</p> 
                      <p>Amount: {reading_time.amount}</p> 
                    </li>
                    )))}
                </ul>
              </td>
              <td>{user.updated_at}</td>
            </tr>
          )
        })}
      </tbody>
    </table>
    );

  return (
    <div>
      <h1>All courses</h1>
      <div className="table-responsive">
        {coursesTableUI}
      </div>
      <div className="container-fluid">
        <h2>Change user name: </h2>
        <div className="card" style={{width: "18rem"}}>
          <div class="card-body"> 
            {formUI} 
          </div>
        </div>
        <div>
          <div style={{color: "green"}}>
            {success && `Name for user with email: ${userData.email } changed.`}
          </div>
        </div>
      </div>
      <div className="container-fluid">
        <h2>All users</h2>
        <div className="table-responsive">
          {usersTableUI}
        </div>
      </div>
    </div>
  )
};

export default Home;