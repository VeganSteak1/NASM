SECTION .data
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 
    integer1: times 4 db 0  
    msg db "Cel mai apropiat numar divizibil cu 3:", 9,10
    len equ $ - msg
    msg2 db "Introduce un numar natural n de la tastatura:", 9,10
    len2 equ $ - msg2
SECTION .text
   global _main 
   extern scanf 
   extern printf     

global main

main:
   mov ecx,msg2
   mov edx, len2
   mov ebx, 1 
   mov eax, 4
   int 0x80

   sub esp, 4
   mov [esp], ebx
   sub esp, 4
   mov [esp], ecx

   sub esp, 4
   mov [esp], dword integer1
   sub esp, 4
   mov [esp], dword formatin
   call scanf
   add esp, 8

   mov ecx,msg
   mov edx, len
   mov ebx, 1 
   mov eax, 4
   int 0x80

   mov eax,dword [integer1]
   mov ebx,3
   mov edx, 0  
   div ebx     
   mov eax, edx
   cmp eax, 2
   jl LESS
   mov eax,1
   add [integer1],eax
   jmp BOTH
   LESS:
   sub [integer1],eax
   BOTH:
   mov ebx,dword [integer1]
   sub esp, 4
   mov [esp], ebx
   sub esp, 4
   mov [esp], dword formatout
   call printf                            
   add esp, 8

   mov ecx, dword [esp]
   add esp, 4
   mov ebx, dword [esp]
   add esp, 4
   mov eax, 0 
   ret
