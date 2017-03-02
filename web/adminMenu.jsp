
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Menu</title>
    </head>
    <body>
                <br><br><br><br><br><br>

        

        <h2>Delete Song</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the id of the song you wish to delete  : </td><td> <input name="songID" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="delete song" />
            <input type="hidden" name ="action" value="deletesong" />
        </form>

        <br><br>
        
        <h2>Delete Album</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the id of the album you wish to delete  : </td><td> <input name="albumID" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="delete item" />
            <input type="hidden" name ="action" value="deletealbum" />
        </form>

        <br><br>
        
        <h2>Delete Artist</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the id of the artist you wish to delete  : </td><td> <input name="artistID" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="delete item" />
            <input type="hidden" name ="action" value="deleteartist" />
        </form>

        <br><br>
        
        <h2>Delete Genre</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the id of the genre you wish to delete  : </td><td> <input name="genreID" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="delete item" />
            <input type="hidden" name ="action" value="deletegenre" />
        </form>

        <br><br>
        
        <h2>Delete Member</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the username of the member you wish to delete  : </td><td> <input name="username" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="delete member" />
            <input type="hidden" name ="action" value="deletemember" />
        </form>

        <br><br>
        
        

        <h2>Search For A member</h2>

        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the username  : </td><td> <input name="username" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Search" />
            <input type="hidden" name ="action" value="searchuser" />
        </form>

        <br><br>

        

        <h2>Add member</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                    <td> Enter the username of the member you wish to add  : </td><td> <input name="username" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter the First name of the member you wish to add  : </td><td> <input name="fname" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter the last name of the member you wish to add  : </td><td> <input name="lname" size=30 type="text" /> </td> 
                </tr>

                <tr>
                    <td> Enter the password of the member you wish to add  : </td><td> <input name="password" size=30 type="password" /> </td> 
                </tr>
                <tr>
                    <td> Enter the phone number of the member you wish to add  : </td><td> <input name="phone" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter the email of the member you wish to add  : </td><td> <input name="email" size=30 type="email" /> </td> 
                </tr>
                <tr>
                    <td> Enter the address line 1 of the member you wish to add  : </td><td> <input name="address1" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter the town of the member you wish to add  : </td><td> <input name="city1" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter the county of the member you wish to add  : </td><td> <input name="county" size=30 type="text" /> </td> 
                </tr>

                <tr>
                    <td> Enter the dob of the member you wish to add  : </td><td> <input name="dob" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Add Member" />
            <input type="hidden" name ="action" value="addUser" />
        </form>


        <br><br>

        

        <h2>Edit items by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="choice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">Name</option>
                    <option value="2">Price</option>
                    <option value="3">Desc</option> 
                    <option value="4">Quantity In Stock</option>
                    


                </select>
                <tr>
                <tr>
                    <td> Enter the id of the item  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Item" />
            <input type="hidden" name ="action" value="editItem" />
        </form>
    </body>
</html>
