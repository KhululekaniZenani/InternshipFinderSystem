<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Filter Internships</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 30px;
        }

        fieldset {
            border: none;
            padding: 0;
            margin: 0;
        }

        legend {
            font-size: 1.2em;
            margin-bottom: 15px;
            color: #555555;
        }

        .radio-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            border: 2px solid #cccccc;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .radio-option:hover {
            background-color: #f0f0f0;
            border-color: #999999;
        }

        .radio-option input[type="radio"] {
            margin-right: 12px;
            accent-color: #007BFF;
        }

        .radio-option input[type="radio"]:checked + label {
            font-weight: bold;
            color: #007BFF;
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        #locationSelect {
            margin-top: 20px;
            display: none;
        }

        #locationSelect select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
    </style>

    <script>
        function toggleSelect() {
            const locRadio = document.getElementById("filterLocation");
            const selectDiv = document.getElementById("locationSelect");
            if (locRadio.checked) {
                selectDiv.style.display = "block";
            } else {
                selectDiv.style.display = "none";
            }
        }

        window.onload = function () {
            const radios = document.getElementsByName("filterBy");
            radios.forEach(radio => {
                radio.addEventListener("change", toggleSelect);
            });
            toggleSelect(); // initialize state
        };
    </script>
</head>
<body>

<div class="container">
    <h1>Filter Internships</h1>

    <form action="FilterInternshipsServlet.do" method="POST">
        <fieldset>
            <legend>Choose an Option:</legend>
            <div class="radio-group">
                <div class="radio-option">
                    <input type="radio" id="filterCompany" name="filterBy" value="company" checked>
                    <label for="filterCompany">Filter by Company</label>
                </div>
                <div class="radio-option">
                    <input type="radio" id="filterLocation" name="filterBy" value="location">
                    <label for="filterLocation">Filter by Location</label>
                </div>
            </div>
        </fieldset>

        <div id="locationSelect">
            <label for="location">Select Location:</label>
            <select name="location" id="location">
                <option value="Cape Town">Cape Town</option>
                <option value="Johannesburg">Johannesburg</option>
                <option value="Durban">Durban</option>
                <option value="Pretoria">Pretoria</option>
                <!-- Add more locations as needed -->
            </select>
        </div>

        <button type="submit" class="submit-button">Submit</button>
    </form>
</div>

</body>
</html>
