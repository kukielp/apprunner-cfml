<cfscript>
    
    config = {
        "serviceName" : "DYNAMODB"                                                          
    };

    dynamo = getCloudService(application.cloud_credentials, config);

    options = {
        "TableName":"Student",
        "ProjectionExpression" : "id, subjects, full_name, registered_class", 
        "Limit": 5
    };
    
    try{
        result = dynamo.scan(options, {            
            "customResponse": true            
        });
        //writedump(result);
    } catch(any e){
        writeDump(e)
    }

</cfscript>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>CFML, DynamoDB and AWS AppRunner</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <link rel="stylesheet" href="css/mdb.min.css" />
  </head>
  <body>
    <div class="container">
      <div class="d-flex justify-content-center align-items-center" >
        <div class="text-center">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">ClassId</th>
                    <th scope="col">Subjects</th>
                  </tr>
                </thead>
                <tbody>

                  <cfoutput>
                  <cfloop array="#result.Items#" item="student" index="i">
                    <tr>
                        <td>#listFirst(student.full_name," ")#</td>
                        <td>#listLast(student.full_name," ")#</td>
                        <td>#student.registered_class#</td>
                        <td>
                            <ul>
                            <cfloop array="#student.subjects#" item="subject">
                                <li>#subject#</li>
                            </cfloop>
                            </ul>
                        </td>

                    </tr>
                    </cfloop>
                    </cfoutput>
                  
                </tbody>
              </table>
        </div>
      </div>
    </div>
  </body>
</html>