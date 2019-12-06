<button class="top" id="top"><i class="fas fa-arrow-up"></i></button>

<style>
    .top {
        transition: all .25s ease-in-out;
        position: fixed;
        z-index: 999;
        bottom: 20px;
        right: 20px;
        border: none;
        outline: none;
        cursor: pointer;
        justify-content: center;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        background-color: #333;
        visibility: hidden;
    }

    .top:hover {
        background-color: #ff6700;
    }

    .top.show {
        visibility: visible !important;
        opacity: 1;
    }

    .top.hide {
        visibility: hidden !important;
        opacity: 0;
    }

</style>
<script>
    const scrollToTopButton = document.getElementById('top');
    const scrollFunc = () => {
        let y = window.scrollY;

        if (y > 500) {
            scrollToTopButton.className = "top show";
        } else {
            scrollToTopButton.className = "top hide";
        }
    };
    window.addEventListener("scroll", scrollFunc);

    const scrollToTop = () => {
        const c = document.documentElement.scrollTop || document.body.scrollTop;
        if (c > 0) {
            window.requestAnimationFrame(scrollToTop);
            window.scrollTo(0, c - c / 10);
        }
    };
    scrollToTopButton.onclick = function (e) {
        e.preventDefault();
        scrollToTop();
    }
</script>
