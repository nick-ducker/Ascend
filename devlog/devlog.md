# 13/07/2020

## Bugfix
  * Get the 
  * Fix create form for new workout
      Moved form helpers to outside of the page divs to have the new button functional on first load.
      Button worked on manual test but styling was wrong.
      Changed form to form_with tag

## Feature
  * Don't allow users to access the edit or delete method of other users workouts
      Added a if statement to the workouts controller to validate and redirect if needed.
      Tested manually by using another user account to try and access an edit method using the URL bar.

  * Delete workout with a check beforehand. 
    Added a delete method to the controller. Added a confirm and delete method to the link to.
    On manual test, post deleted but without redirect. Redirect added to method.
    Feature is functional on second manual test. 

  * Other users should not be able to delete other peoples posts. 
    Added user validation before running destroy in the delete action
    On manual test, could not delete post by replacing html button code.

  