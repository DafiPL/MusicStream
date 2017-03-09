
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Menu</title>
    </head>
    <body>
        <br><br><br><br><br><br>


        <h2>Edit items by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="choice" >
                    <option value="">Choose an option to delete</option>
                    <option value="song">Song</option>
                    <option value="album">Album</option>
                    <option value="artist">Artist</option> 
                    <option value="genre">Genre</option>
                    <option value="member">Member</option>



                </select>
                <tr>
                <tr>
                    <td> Enter the id of the item  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>

            </table>
            <input type="submit" value="delete" />
            <input type="hidden" name ="action" value="delete" />
        </form>

        <h2>Search item by Choice</h2>

        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="searchchoice" >
                    <option value="">Choose an option to search</option>
                    <option value="song">Song</option>
                    <option value="album">Album</option>
                    <option value="artist">Artist</option> 
                    <option value="genre">Genre</option>
                    <option value="member">Member</option>
                </select>
                <tr>
                <tr>
                    <td> Enter the name of the item  : </td><td> <input name="itemName" size=30 type="text" /> </td> 
                </tr>

            </table>
            <input type="submit" value="Search" />
            <input type="hidden" name ="action" value="search" />
        </form>

        <br><br>

 <h2>Add item by Choice</h2>

        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="addchoice" >
                    <option value="">Choose an option to add</option>
                    <option value="song">Song</option>
                    <option value="album">Album</option>
                    <option value="artist">Artist</option> 
                    <option value="genre">Genre</option>
                    <option value="member">Member</option>
                </select>
                
                <tr>
                <tr>
                    <td> Enter the name of the item  : </td><td> <input name="itemName" size=30 type="text" /> </td> 
                </tr>

            </table>
            <input type="submit" value="Add" />
            <input type="hidden" name ="action" value="add" />
        </form>

        <br><br>

        



        <h2>Edit songs by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="editchoice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">SongID</option>
                    <option value="2">albumID</option>
                    <option value="3">song Name</option> 
                    <option value="4">Song Release</option>
                    
                </select>
                <tr>
                <tr>
                    <td> Enter the id of the song  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Song" />
            <input type="hidden" name ="action" value="edit" />
            <input type="hidden" name ="control" value="1" />
        </form>
        
        <h2>Edit album by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="editchoice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">albumId</option>
                    <option value="2">genreID</option>
                    <option value="3">artistID</option>
                    <option value="4">album Name</option> 
                    <option value="5">Album Price</option>
                    <option value="6">Amount In Stock</option>
                    <option value="7">Album Format</option>
                    <option value="8">Release Date</option>
                    
                </select>
                <tr>
                <tr>
                    <td> Enter the id of the song  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Album" />
            <input type="hidden" name ="action" value="edit" />
            <input type="hidden" name ="control" value="2" />
        </form>
        
        <h2>Edit artist by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="editchoice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">ArtistID</option>
                    <option value="2">Artist Name</option>
                    <option value="3">Artist Age</option> 
                    <option value="4">Artist Bio</option>
                    <option value="5">Artist Picture</option>
                    
                </select>
                <tr>
                <tr>
                    <td> Enter the id of the song  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Artist" />
            <input type="hidden" name ="action" value="edit" />
            <input type="hidden" name ="control" value="3" />
        </form>
        
        <h2>Edit genre by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="editchoice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">GenreID</option>
                    <option value="2">Genre Name</option>
                    
                    
                </select>
                <tr>
                <tr>
                    <td> Enter the id of the song  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Genre" />
            <input type="hidden" name ="action" value="edit" />
            <input type="hidden" name ="control" value="4" />
            
        </form>
        
        <h2>Edit Member by choice</h2>
        <form action="FrontController" method="post">
            <table>
                <tr>
                <select name="editchoice" >
                    <option value="">Choose an option to edit</option>
                    <option value="1">Username</option>
                    <option value="2">First Name</option>
                    <option value="3">Last Name</option> 
                    <option value="4">User Type </option>
                    <option value="5">Password </option>
                    <option value="6">Phone </option>
                    <option value="7">Email </option>
                    <option value="8">Address Line 1 </option>
                    <option value="9">Town </option>
                    <option value="10">Country </option>
                    <option value="11">Salt Gen </option>
                    <option value="12">Register Date </option>
                    <option value="13">Expiry Date </option>>
                    
                </select>
                <tr>
                <tr>
                    <td> Enter the id of the song  : </td><td> <input name="itemId" size=30 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Enter new value  : </td><td> <input name="value" size=30 type="text" /> </td> 
                </tr>
            </table>
            <input type="submit" value="Edit Member" />
            <input type="hidden" name ="action" value="edit" />
            <input type="hidden" name ="control" value="5" />
        </form>
    </body>
</html>
