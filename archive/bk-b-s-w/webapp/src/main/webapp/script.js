// script.js
document.getElementById('registrationForm').addEventListener('submit', function(e) {
    e.preventDefault();
  
    // Retrieve form inputs
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
  
    // Send registration request to backend API
    fetch('/api/users/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ username: username, password: password })
    })
    .then(response => response.json())
    .then(data => {
      // Handle registration success
      alert('Registration successful!');
      // Additional logic, such as redirecting to a dashboard or login page
    })
    .catch(error => {
      // Handle registration error
      alert('Registration failed. Please try again.');
    });
  });
  
  document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
  
    // Retrieve form inputs
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
  
    // Send login request to backend API
    fetch('/api/users/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ username: username, password: password })
    })
    .then(response => response.json())
    .then(data => {
      // Handle login success
      alert('Login successful!');
      // Additional logic, such as redirecting to a dashboard or home page
    })
    .catch(error => {
      // Handle login error
      alert('Login failed. Please check your credentials and try again.');
    });
  });
  