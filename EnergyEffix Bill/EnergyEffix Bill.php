<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible"content="ie=edge">
    <meta name="Description"content="Enter your description here"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assests/css/style.css">
    <title>EnergyEffix Bill</title>
  </head>
  <body>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h1>EnergyEffix Bill Calculation</h1>
            <hr>
            <form method="post" action="">
                <div class="form-group">
                    <label for="units">Units</label>
                    <input type="units" class="form-control" id="units" name="units">   
                </div>
                <button type="submit" class="btn btn-primary" name="btn">Get Bill</button>
            </form>
            <?php
                if(isset($_POST['btn']))
                {
                    $units =$_POST['units'];
                    $total =0;
                    echo "<hr><h4>Bill Details</h4><hr>";
                    // 1st per unit 8.00Rs (0 - 30)
                    if($units>=0 && $units<=30)
                    {
                        $tot = $units * 8 + 150;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Monthly Total Bill = $total<hr>";
                    }
                    // 2nd per unit 20.00Rs (31 - 60)
                    else if($units>30 && $units<=60)
                    {
                        $tot = 240 + ($units-30) * 20 + 300 ;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Monthly Total Bill = $total<hr>";
                    }
                    // 3rd per unit 30.00Rs (61 - 90)
                    else if($units>60 && $units<=90)
                    {
                        $tot = 840 + ($units-60) * 30 + 400;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Mothly Total Bill = $total<hr>";
                    }
                    // 4th per unit 50.00Rs (91 - 120)
                    else if($units>90 && $units<=120)
                    {
                        $tot = 1740 + ($units-90) * 50 + 1000;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Monthly Total Bill = $total<hr>";
                    }
                    // 5th per unit 50.00Rs (121 - 180)
                    else if($units>120 && $units<=180)
                    {
                        $tot = 3240 + ($units-120) * 50 + 1500;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Mothly Total Bill = $total<hr>";
                    }
                    // 6th per unit 75.00Rs (181 < )
                    else{
                        $tot = 6240 + ($units-180) * 75 + 2000;
                        $tot1 = $tot * 18 / 100;
                        $total = $tot1 + $tot;
                        echo "<hr>Monthly Total Bill = $total<hr>";
                    }
                }
            ?>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
