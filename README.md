# Reproducibility in R Workshop

## Denison University, Fall 2024

---

## Workshop Description

Have you wondered what would happen if you looked for the data and code behind a published study? Do you think you would be able to find what you need to run it on your computer? Would the code would run without errors? Would your results match what's reported in the publication?

This hands-on session will invite a critical conversation about how liberal arts institutions can teach reproducibility across the curriculum, and it will provide a gentle introduction to reproducible research and code using RStudio, including:

- Relative paths, working directory, folder organization, hidden files
- Built-in tools (e.g., 'here' and 'renv' packages, sessionInfo, .rproj file, .rhistory file)
- Using literate programming formats for reproducibility (e.g., RMD, Quarto)
- Core concepts for teaching reproducibility 

---

## Repository Description 

- `README.md` ... this file
- `activity.R` ... snippets of R code with errors deliberately inserted
- `working_code.R` ... snippets of R code with no errors (but lots of room for improvement)
- `refactored.Rmd` ... refactored code from `working_code.R` with discussion of how it works and what's been changed. (Still some room for improvement, I reckon.)
- `refactored.html` ... refactored code knitted to HTML format
- `RR-denison-2024.rproj` ... project file
- `data`
	- `cbus_listings.csv` ... airbnb listings data from one of the labs used in DA 101
	- `cbus_landmarks.csv` ... columbus landmark and location data to merge with listings
- `renv` ... R virtual environment support
- `renv.lock` ... R virtual environment congifuration
- `utils`
	- `dv.R` ... modified Vincenty Distance function to support use with `mutate`
	
	
	
	


---

## Workshop Itinerary 

1. Survey 
2. Discussion 
3. Activity
4. Questions & More Discussion
5. Conclusion

--- 

## Links

- Slides: https://bit.ly/4ctwvii
- Survey: https://bit.ly/denison-RR-2024-survey
- Repo: https://bit.ly/denison-RR-2024

---