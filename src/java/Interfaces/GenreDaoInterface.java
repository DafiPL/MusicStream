/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Genre;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface GenreDaoInterface {

    public int editAllGenreDetailsById(int id, String Textvalue, double NumericValue, int choice);

    public ArrayList<Genre> searchForGenre(String title);

    public ArrayList<Genre> getAllGenres();

    public int deleteGenre(int id);

    public Genre getGenreById(int genreID);

    public int addGenre(Genre g);
}
