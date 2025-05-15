/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.websraper;


import org.openqa.selenium.*;

import org.openqa.selenium.support.ui.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.json.JSONObject;
import org.bson.types.ObjectId;

import java.security.MessageDigest;
import java.time.Duration;
import java.util.Date;

public class LinkedInScraper {

    public static void scrapeLinkedInJobs(String email, String password, String keyword) {
        System.out.println("Scraping data from LinkedIn Jobs...");

        // Setup Chrome WebDriver
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless", "--disable-gpu", "--no-sandbox");
        System.setProperty("webdriver.chrome.driver", "src/main/resources/drivers/chromedriver-win64/chromedriver.exe");

        WebDriver driver = new ChromeDriver(options);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

        String storeName = "LinkedIn Jobs";

        try {
            driver.get("https://www.linkedin.com/login");
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("username"))).sendKeys(email);
            driver.findElement(By.id("password")).sendKeys(password);
            driver.findElement(By.xpath("//button[@type='submit']")).click();

            driver.get("https://www.linkedin.com/jobs/search/?keywords=" + keyword);

            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("ul.jobs-search__results-list")));

            int jobCounter = 0;
            Elements jobs = Jsoup.parse(driver.getPageSource()).select("ul.jobs-search__results-list li");

            for (Element job : jobs) {
                try {
                    String title = job.select("a.job-card-list__title").text();
                    String company = job.select("a.job-card-container__company-name").text();
                    String location = job.select("li.job-card-container__metadata-item").text();
                    String jobLink = job.select("a.job-card-list__title").attr("href");
                    String logoUrl = job.select("img.artdeco-entity-image").attr("src");

                    // Create unique ObjectId
                    String uniqueId = title + company + location + System.currentTimeMillis();
                    MessageDigest digest = MessageDigest.getInstance("SHA-256");
                    byte[] hash = digest.digest(uniqueId.getBytes());
                    StringBuilder hexString = new StringBuilder();
                    for (byte b : hash) {
                        hexString.append(String.format("%02x", b));
                    }
                    String objectIdHex = hexString.toString().substring(0, 24);
                    ObjectId objectId = new ObjectId(objectIdHex);

                    // Compose JSON
                    JSONObject jobJson = new JSONObject();
                    jobJson.put("_id", objectId.toString());
                    jobJson.put("title", title);
                    jobJson.put("company", company);
                    jobJson.put("location", location);
                    jobJson.put("jobLink", jobLink.startsWith("http") ? jobLink : "https://www.linkedin.com" + jobLink);
                    jobJson.put("logoUrl", logoUrl);
                    jobJson.put("storeName", storeName);
                    jobJson.put("creationDate", new Date());

                    // Print results
                    System.out.println(jobJson.toString(2));
                    System.out.println("--------------------------------------------------");

                    jobCounter++;

                } catch (Exception e) {
                    System.out.println("Error parsing a job listing: " + e.getMessage());
                }
            }

            if (jobCounter == 0) {
                System.out.println("No jobs found.");
            }

        } catch (Exception e) {
            System.out.println("Error during LinkedIn scraping: " + e.getMessage());
        } finally {
            driver.quit();
        }
    }

    public static void main(String[] args) {
        // Replace with valid credentials for real scraping
        scrapeLinkedInJobs("your_email@example.com", "your_password", "Java Developer");
    }
}
