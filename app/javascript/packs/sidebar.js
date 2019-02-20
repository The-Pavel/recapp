var sidebarItems = document.querySelectorAll(".sidebar-item");

for (var i = 0; i < sidebarItems.length; i++) {
  sidebarItems[i].addEventListener("click", function() {
    document.querySelector(".sidebar-item-active").classList.remove('sidebar-item-active');
    this.classList.add('sidebar-item-active');
  });
}

