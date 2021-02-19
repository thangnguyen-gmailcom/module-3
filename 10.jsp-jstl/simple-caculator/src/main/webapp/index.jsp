<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form action="/calculator" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" name="first" class="form-control" placeholder="First operand">
            </div>
            <div class="col">
                <input type="text" name="second" class="form-control" placeholder="Second operand ">
            </div>
        </div>
        <div class="form-row align-items-center">
            <div class="col-auto my-1">
                <select class="custom-select mr-sm-2" name="operator" id="inlineFormCustomSelect">
                    <option value="+" selected>Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </div>
            <div class="col-auto my-1">
                <button type="submit" class="btn btn-primary">Calculate</button>
            </div>
        </div>
    </form>
</body>
</html>
