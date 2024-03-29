-- What were the top 10; movies according to IMDB score?
SELECT title, 
type, 
Imdb_Score
FROM Mytable
WHERE Imdb_Score >= 8.0
AND type = 'MOVIE'
ORDER BY Imdb_Score DESC
LIMIT 10;

-- What were the top 10; shows according to IMDB score? 
SELECT title, 
type, 
imdb_score
FROM Mytable
WHERE imdb_score >= 8.0
AND type = 'SHOW'
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the bottom 10; movies according to IMDB score? 
SELECT title, 
type, 
imdb_score
FROM Mytable
WHERE type = 'MOVIE'
ORDER BY imdb_score ASC
LIMIT 10;

-- What were the bottom 10; shows according to IMDB score? 
SELECT title, 
type, 
imdb_score
FROM Mytable
WHERE type = 'SHOW'
ORDER BY imdb_score ASC
LIMIT 10;

-- What were the average IMDB and TMDB scores for shows and movies? 
SELECT DISTINCT type, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) as avg_tmdb_score
FROM Mytable
GROUP BY type; 

-- Count of movies and shows in each decade
SELECT CONCAT(FLOOR(release_year / 10) * 10, 's') AS decade,
	COUNT(*) AS movies_shows_count
FROM Mytable
WHERE release_year >= 1940
GROUP BY CONCAT(FLOOR(release_year / 10) * 10, 's')
ORDER BY decade;

-- What were the average IMDB and TMDB scores for each production country?
SELECT DISTINCT production_countries, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) AS avg_tmdb_score
FROM Mytable
GROUP BY production_countries
ORDER BY avg_imdb_score DESC;

-- What were the average IMDB and TMDB scores for each age certification for shows and movies?
SELECT DISTINCT age_certification, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) AS avg_tmdb_score
FROM Mytable
GROUP BY age_certification
ORDER BY avg_imdb_score DESC;

-- What were the 5 most common age certifications for movies?
SELECT age_certification, 
COUNT(*) AS certification_count
FROM Mytable
WHERE type = 'Movie' 
AND age_certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count DESC
LIMIT 5;


-- Calculating the average runtime of movies and TV shows separately
SELECT 
'Movies' AS content_type,
ROUND(AVG(runtime),2) AS avg_runtime_min
FROM Mytable
WHERE type = 'Movie'
UNION ALL
SELECT 
'Show' AS content_type,
ROUND(AVG(runtime),2) AS avg_runtime_min
FROM Mytable
WHERE type = 'Show';


-- Which shows on Netflix have the most seasons?
SELECT title, 
SUM(seasons) AS total_seasons
FROM Mytable 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC
LIMIT 10;

-- Which genres had the most movies? 
SELECT genres, 
COUNT(*) AS title_count
FROM Mytable 
WHERE type = 'Movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;

-- Which genres had the most shows? 
SELECT genres, 
COUNT(*) AS title_count
FROM Mytable 
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;

-- What were the total number of titles for each year? 
SELECT release_year, 
COUNT(*) AS title_count
FROM Mytable 
GROUP BY release_year
ORDER BY release_year DESC;


-- What were the top 3 most common genres?
SELECT t.genres, 
COUNT(*) AS genre_count
FROM Mytable AS t
WHERE t.type = 'Movie'
GROUP BY t.genres
ORDER BY genre_count DESC
LIMIT 3;
