(require 'req-package)

(req-package swiper
  :ensure t
  :require ivy
  :config
  (global-set-key (kbd "M-s") 'swiper)
  (define-key swiper-map (kbd "M-r") 'swiper-query-replace)
  (define-key swiper-map (kbd "M-q") nil)
  (define-key swiper-map (kbd "M-;") 'swiper-avy))

(provide 'init-swiper)
