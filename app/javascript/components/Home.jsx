import React, { useEffect, useState } from "react";

  const Home = () => {
    const [courses, setCourses] =  useState([])
    const [users, setUsers] =  useState([])
    const [userData, setUserData] =  useState({ name: "", email: ""})
    const [success, setSuccess] =  useState(false)
    const [error, setError] =  useState({message:"", hasError: false})

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
          name: userData.name.trim(),
          email: userData.email
        }),
      })
      .then((data) => {
        if (data.ok) {
          setError({hasError: false, message:""})
          get_users()
          setSuccess(true)
        } else {
          setSuccess(false)
          return data.text().then(text => { throw new Error(text) })
        }
      })
      .catch((err) => setError({hasError: true, ...JSON.parse(err.message)}));
    };

    useEffect(() => {
      get_courses()
      get_users()
    }, []);

    const formUI = (
      <form onSubmit={onSubmit}>
        <label className="form-label">
          Select an email of the user you want to change the name:
        </label>
        <br />
        <select className="form-select" aria-label="Default select example" onChange={(e) => setUserData({...userData, email: e.target.value })} required>
          <option selected value="">Select a email</option>
          {users.map((user) => (
            <option value={user.email} key={user.id}>{user.email}</option>
          ))}
        </select>

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
            <tr key={course.id}>
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
            <tr key={user.id}>
              <th scope="row">{user.id}</th>
              <td>{user.email}</td>
              <td>{user.name}</td>
              <td>{user.role}</td>
              <td>{user.course}</td>
              <td>
                <ul>
                  {user.reading_times?.map((reading_time => (
                    <li key={reading_time.amount+user.id}>
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
          <div className="card-body"> 
            {formUI} 
          </div>
        </div>
        <div>
          <div style={{color: "green"}}>
            {success && `Name for user with email: ${userData.email } changed.`}
          </div>
          <div style={{color: "red"}}>
            {error.hasError && error.message}
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