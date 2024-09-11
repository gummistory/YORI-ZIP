/**
 * 
 */
  document.querySelectorAll('.next_input').forEach(function(input) {
        input.addEventListener('input', function() {
            if (input.value.trim() !== "") {
                input.classList.add('filled');
            } else {
                input.classList.remove('filled');
            }
        });
    });